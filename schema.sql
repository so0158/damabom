-- =========================
-- 1) Master tables
-- =========================

CREATE TABLE users (
  id            bigserial PRIMARY KEY,
  name          text,
  status        text,
  email         text,
  phone         text,          -- phone은 integer 비추(앞 0, 국가코드, 하이픈 문제)
  pw            text,
  last_updated  timestamptz,
  created       timestamptz DEFAULT now()
);

CREATE TABLE stores (
  id     bigserial PRIMARY KEY,
  name   text NOT NULL,
  status text
);

CREATE TABLE products (
  id           bigserial PRIMARY KEY,
  name         text NOT NULL,
  description  text,
  price        numeric(12,2) NOT NULL,
  is_active    boolean NOT NULL DEFAULT true,
  last_updated timestamptz DEFAULT now()
);

CREATE TABLE option_group (
  id             bigserial PRIMARY KEY,
  name           text NOT NULL,
  selection_type text NOT NULL,          -- SINGLE/MULTI 같은 값
  is_required    boolean NOT NULL DEFAULT false,
  max_select     integer                 -- SINGLE이면 1 같은 규칙
);

CREATE TABLE option_item (
  id            bigserial PRIMARY KEY,
  opt_group_id  bigint NOT NULL REFERENCES option_group(id),
  name          text NOT NULL,
  price         numeric(12,2) NOT NULL DEFAULT 0,
  description   text,
  display_order integer NOT NULL DEFAULT 0,

  -- 복합 FK를 위한 전제 제약(중요)
  CONSTRAINT uq_opt_item_id_group UNIQUE (id, opt_group_id)
);


-- =========================
-- 2) Product <-> Option Group mapping
-- =========================

CREATE TABLE product_option_group (
  product_id    bigint NOT NULL REFERENCES products(id),
  opt_group_id  bigint NOT NULL REFERENCES option_group(id),
  display_order integer NOT NULL DEFAULT 0,

  CONSTRAINT pk_product_option_group PRIMARY KEY (product_id, opt_group_id)
);


-- =========================
-- 3) Cart tables
-- =========================

CREATE TABLE carts (
  id           bigserial PRIMARY KEY,
  created_date timestamptz NOT NULL DEFAULT now(),
  status       text NOT NULL DEFAULT 'S',
  CONSTRAINT ck_cart_status CHECK (status IN ('S', 'P', 'E'))  -- S=Shopping, P=Paid, E=Expired
);

CREATE TABLE cart_item (
  id               bigserial PRIMARY KEY,
  cart_id          bigint NOT NULL REFERENCES carts(id),
  product_id       bigint NOT NULL REFERENCES products(id),
  item_qty         integer NOT NULL CHECK (item_qty > 0),
  opt_signature    varchar(255) NOT NULL,
  last_updated     timestamptz NOT NULL DEFAULT now(),

  -- 같은 카트에서 같은 상품 + 같은 옵션조합이면 한 줄만
  CONSTRAINT uq_cart_item_sig UNIQUE (cart_id, product_id, opt_signature)
);

CREATE TABLE cart_item_option (
  id            bigserial PRIMARY KEY,
  cart_item_id  bigint NOT NULL REFERENCES cart_item(id) ON DELETE CASCADE,
  opt_item_id   bigint NOT NULL,
  opt_group_id  bigint NOT NULL,
  qty           integer NOT NULL DEFAULT 1 CHECK (qty > 0),
  price_delta   numeric(12,2) NOT NULL DEFAULT 0,

  -- 같은 cart_item에서 같은 option_item 중복 row 금지(수량은 qty로)
  CONSTRAINT uq_cart_item_opt UNIQUE (cart_item_id, opt_item_id),

  -- option_item이 해당 option_group에 속한다를 DB가 강제(복합 FK)
  CONSTRAINT fk_cart_opt_item_group
    FOREIGN KEY (opt_item_id, opt_group_id)
    REFERENCES option_item (id, opt_group_id),

  -- (선택) option_group 자체 존재 보장도 명시적으로
  CONSTRAINT fk_cart_opt_group
    FOREIGN KEY (opt_group_id)
    REFERENCES option_group (id)
);


-- =========================
-- 4) Order tables
-- =========================

CREATE TABLE orders (
  id           bigserial PRIMARY KEY,
  order_time   timestamptz NOT NULL DEFAULT now(),
  total_amount numeric(12,2) NOT NULL DEFAULT 0,
  status       text NOT NULL DEFAULT 'CREATED',
  store_id     bigint NOT NULL REFERENCES stores(id),
  user_id      bigint REFERENCES users(id)
);

CREATE TABLE order_item (
  id           bigserial PRIMARY KEY,
  order_id     bigint NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id   bigint NOT NULL REFERENCES products(id),
  name         text NOT NULL,                 -- 스냅샷
  unit_price   numeric(12,2) NOT NULL,        -- 스냅샷
  qty          integer NOT NULL CHECK (qty > 0),
  total_amount numeric(12,2) NOT NULL,        -- 스냅샷(또는 계산 컬럼으로 둘거면 정책 필요)
  description  text
);

CREATE TABLE order_item_option (
  id            bigserial PRIMARY KEY,
  order_item_id bigint NOT NULL REFERENCES order_item(id) ON DELETE CASCADE,
  opt_item_id   bigint NOT NULL,
  opt_group_id  bigint NOT NULL,
  qty           integer NOT NULL DEFAULT 1 CHECK (qty > 0),
  price_delta   numeric(12,2) NOT NULL DEFAULT 0,

  CONSTRAINT uq_order_item_opt UNIQUE (order_item_id, opt_item_id),

  CONSTRAINT fk_order_opt_item_group
    FOREIGN KEY (opt_item_id, opt_group_id)
    REFERENCES option_item (id, opt_group_id),

  CONSTRAINT fk_order_opt_group
    FOREIGN KEY (opt_group_id)
    REFERENCES option_group (id)
);


-- =========================
-- 5) Indexes (simple naming)
-- =========================

-- cart
CREATE INDEX ix_cart_item_cart
  ON cart_item(cart_id);

CREATE INDEX ix_cart_item_opt_item
  ON cart_item_option(cart_item_id);

CREATE INDEX ix_cart_item_opt_opt
  ON cart_item_option(opt_item_id);

-- product / option
CREATE INDEX ix_prod_opt_grp_prod
  ON product_option_group(product_id);

CREATE INDEX ix_opt_item_group
  ON option_item(opt_group_id);

-- order
CREATE INDEX ix_order_item_order
  ON order_item(order_id);

CREATE INDEX ix_order_item_opt_item
  ON order_item_option(order_item_id);
