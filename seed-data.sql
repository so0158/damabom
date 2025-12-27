-- ==========================================
-- 개발용 샘플 데이터
-- ==========================================

-- 1. 매장 데이터
INSERT INTO stores (id, name, status) VALUES
(1, '강남점', 'ACTIVE'),
(2, '홍대점', 'ACTIVE'),
(3, '잠실점', 'MAINTENANCE');

-- 2. 사용자 데이터
INSERT INTO users (id, name, status, email, phone, pw, last_updated, created) VALUES
(1, '김철수', 'ACTIVE', 'chulsoo@example.com', '010-1234-5678', 'hashed_pw_1', now(), now()),
(2, '이영희', 'ACTIVE', 'younghee@example.com', '010-2345-6789', 'hashed_pw_2', now(), now()),
(3, '박민수', 'ACTIVE', 'minsu@example.com', '010-3456-7890', 'hashed_pw_3', now(), now()),
(4, '정수진', 'ACTIVE', 'sujin@example.com', '010-4567-8901', 'hashed_pw_4', now(), now()),
(5, '최동욱', 'INACTIVE', 'dongwook@example.com', '010-5678-9012', 'hashed_pw_5', now(), now()),
(6, '강혜진', 'ACTIVE', 'hyejin@example.com', '010-6789-0123', 'hashed_pw_6', now(), now()),
(7, '윤서준', 'ACTIVE', 'seojun@example.com', '010-7890-1234', 'hashed_pw_7', now(), now()),
(8, '한지우', 'ACTIVE', 'jiwoo@example.com', '010-8901-2345', 'hashed_pw_8', now(), now());

-- 3. 상품 데이터
INSERT INTO products (id, name, description, price, is_active, last_updated) VALUES
-- 커피
(1, '아메리카노', '신선한 원두로 내린 클래식 아메리카노', 4500.00, true, now()),
(2, '카페라떼', '부드러운 우유와 에스프레소의 조화', 5000.00, true, now()),
(3, '카푸치노', '풍성한 우유 거품이 올라간 카푸치노', 5000.00, true, now()),
(4, '카라멜 마키아또', '달콤한 카라멜 시럽과 에스프레소', 5500.00, true, now()),
(5, '바닐라 라떼', '부드러운 바닐라향 라떼', 5500.00, true, now()),
-- 음료
(6, '녹차 라떼', '고소한 녹차와 우유의 조화', 5200.00, true, now()),
(7, '초코 라떼', '진한 초콜릿 라떼', 5200.00, true, now()),
(8, '딸기 스무디', '신선한 딸기로 만든 스무디', 6000.00, true, now()),
(9, '망고 스무디', '달콤한 망고 스무디', 6000.00, true, now()),
-- 디저트
(10, '크루아상', '버터 풍미 가득한 크루아상', 3500.00, true, now()),
(11, '초코 머핀', '진한 초콜릿 칩 머핀', 3800.00, true, now()),
(12, '블루베리 머핀', '상큼한 블루베리 머핀', 3800.00, true, now()),
(13, '치즈케이크', '부드러운 뉴욕 스타일 치즈케이크', 5500.00, true, now()),
(14, '티라미수', '이탈리아 정통 티라미수', 6000.00, true, now()),
-- 비활성 상품
(15, '시즌 한정 음료', '계절 한정 음료 (현재 판매 종료)', 6500.00, false, now());

-- 4. 옵션 그룹 데이터
INSERT INTO option_group (id, name, selection_type, is_required, max_select) VALUES
(1, '사이즈', 'SINGLE', true, 1),
(2, '온도', 'SINGLE', true, 1),
(3, '샷 추가', 'SINGLE', false, 1),
(4, '시럽 추가', 'MULTI', false, 3),
(5, '토핑', 'MULTI', false, 2),
(6, '우유 종류', 'SINGLE', false, 1);

-- 5. 옵션 아이템 데이터
INSERT INTO option_item (id, opt_group_id, name, price, description, display_order) VALUES
-- 사이즈 (그룹 1)
(1, 1, 'Tall', 0.00, '355ml', 1),
(2, 1, 'Grande', 500.00, '473ml', 2),
(3, 1, 'Venti', 1000.00, '591ml', 3),

-- 온도 (그룹 2)
(4, 2, 'HOT', 0.00, '따뜻하게', 1),
(5, 2, 'ICE', 0.00, '차갑게', 2),

-- 샷 추가 (그룹 3)
(6, 3, '샷 추가 안함', 0.00, '기본 샷', 1),
(7, 3, '샷 1개 추가', 500.00, '에스프레소 샷 1개 추가', 2),
(8, 3, '샷 2개 추가', 1000.00, '에스프레소 샷 2개 추가', 3),

-- 시럽 추가 (그룹 4)
(9, 4, '바닐라 시럽', 500.00, '바닐라 향 시럽', 1),
(10, 4, '카라멜 시럽', 500.00, '카라멜 향 시럽', 2),
(11, 4, '헤이즐넛 시럽', 500.00, '헤이즐넛 향 시럽', 3),
(12, 4, '모카 시럽', 500.00, '초콜릿 모카 시럽', 4),

-- 토핑 (그룹 5)
(13, 5, '휘핑크림', 500.00, '생크림 토핑', 1),
(14, 5, '초코 드리즐', 300.00, '초콜릿 소스', 2),
(15, 5, '카라멜 드리즐', 300.00, '카라멜 소스', 3),

-- 우유 종류 (그룹 6)
(16, 6, '일반 우유', 0.00, '일반 우유', 1),
(17, 6, '저지방 우유', 0.00, '저지방 우유', 2),
(18, 6, '두유', 500.00, '두유로 변경', 3),
(19, 6, '오트 밀크', 700.00, '오트 밀크로 변경', 4);

-- 6. 상품-옵션그룹 매핑
-- 커피 음료들 (1-5): 사이즈, 온도, 샷추가, 시럽추가, 토핑, 우유종류
INSERT INTO product_option_group (product_id, opt_group_id, display_order) VALUES
(1, 1, 1), (1, 2, 2), (1, 3, 3), (1, 4, 4),
(2, 1, 1), (2, 2, 2), (2, 3, 3), (2, 4, 4), (2, 5, 5), (2, 6, 6),
(3, 1, 1), (3, 2, 2), (3, 3, 3), (3, 5, 4), (3, 6, 5),
(4, 1, 1), (4, 2, 2), (4, 3, 3), (4, 5, 4), (4, 6, 5),
(5, 1, 1), (5, 2, 2), (5, 3, 3), (5, 5, 4), (5, 6, 5),

-- 라떼류 (6-7): 사이즈, 온도, 토핑, 우유종류
(6, 1, 1), (6, 2, 2), (6, 5, 3), (6, 6, 4),
(7, 1, 1), (7, 2, 2), (7, 5, 3), (7, 6, 4),

-- 스무디 (8-9): 사이즈, 토핑만
(8, 1, 1), (8, 5, 2),
(9, 1, 1), (9, 5, 2);

-- 디저트는 옵션 없음

-- 7. 장바구니 데이터
INSERT INTO carts (id, created_date, status) VALUES
(1, now() - interval '30 minutes', 'S'),  -- 쇼핑 중
(2, now() - interval '1 hour', 'P'),      -- 결제 완료
(3, now() - interval '2 hours', 'S'),     -- 쇼핑 중
(4, now() - interval '3 days', 'E');      -- 만료됨

-- 8. 장바구니 아이템
INSERT INTO cart_item (id, cart_id, product_id, item_qty, opt_signature, last_updated) VALUES
-- 카트 1 (쇼핑 중)
(1, 1, 1, 2, 'size:2|temp:5|shot:7', now()),           -- 아메리카노 Grande ICE 샷추가
(2, 1, 2, 1, 'size:1|temp:4|milk:18', now()),          -- 카페라떼 Tall HOT 두유
(3, 1, 10, 2, 'none', now()),                           -- 크루아상 2개

-- 카트 2 (결제 완료)
(4, 2, 4, 1, 'size:3|temp:5|topping:13', now()),       -- 카라멜 마키아또 Venti ICE 휘핑크림
(5, 2, 13, 1, 'none', now()),                           -- 치즈케이크

-- 카트 3 (쇼핑 중)
(6, 3, 8, 2, 'size:2|topping:13', now()),              -- 딸기 스무디 Grande 휘핑크림
(7, 3, 11, 1, 'none', now()),                           -- 초코 머핀

-- 카트 4 (만료됨)
(8, 4, 1, 1, 'size:1|temp:4', now() - interval '3 days'); -- 아메리카노 Tall HOT

-- 9. 장바구니 아이템 옵션
INSERT INTO cart_item_option (cart_item_id, opt_item_id, opt_group_id, qty, price_delta) VALUES
-- cart_item 1: 아메리카노 Grande ICE 샷추가
(1, 2, 1, 1, 500.00),   -- Grande
(1, 5, 2, 1, 0.00),     -- ICE
(1, 7, 3, 1, 500.00),   -- 샷 1개 추가

-- cart_item 2: 카페라떼 Tall HOT 두유
(2, 1, 1, 1, 0.00),     -- Tall
(2, 4, 2, 1, 0.00),     -- HOT
(2, 18, 6, 1, 500.00),  -- 두유

-- cart_item 4: 카라멜 마키아또 Venti ICE 휘핑크림
(4, 3, 1, 1, 1000.00),  -- Venti
(4, 5, 2, 1, 0.00),     -- ICE
(4, 13, 5, 1, 500.00),  -- 휘핑크림

-- cart_item 6: 딸기 스무디 Grande 휘핑크림
(6, 2, 1, 1, 500.00),   -- Grande
(6, 13, 5, 1, 500.00),  -- 휘핑크림

-- cart_item 8: 아메리카노 Tall HOT
(8, 1, 1, 1, 0.00),     -- Tall
(8, 4, 2, 1, 0.00);     -- HOT

-- 10. 주문 데이터
INSERT INTO orders (id, order_time, total_amount, status, store_id, user_id) VALUES
(1, now() - interval '2 hours', 18500.00, 'COMPLETED', 1, 1),
(2, now() - interval '4 hours', 13000.00, 'COMPLETED', 1, 2),
(3, now() - interval '1 day', 25500.00, 'COMPLETED', 2, 3),
(4, now() - interval '2 days', 8500.00, 'CANCELLED', 1, 4),
(5, now() - interval '3 days', 32000.00, 'COMPLETED', 2, 6),
(6, now() - interval '5 minutes', 11000.00, 'PREPARING', 1, 7),
(7, now() - interval '10 minutes', 7000.00, 'CREATED', 1, 8);

-- 11. 주문 아이템
INSERT INTO order_item (id, order_id, product_id, name, unit_price, qty, total_amount, description) VALUES
-- 주문 1: 김철수
(1, 1, 1, '아메리카노', 5500.00, 2, 11000.00, 'Grande, ICE, 샷추가'),
(2, 1, 10, '크루아상', 3500.00, 2, 7000.00, NULL),
(3, 1, 11, '초코 머핀', 3800.00, 1, 3800.00, NULL),

-- 주문 2: 이영희
(4, 2, 2, '카페라떼', 6000.00, 1, 6000.00, 'Tall, HOT, 두유'),
(5, 2, 13, '치즈케이크', 5500.00, 1, 5500.00, NULL),

-- 주문 3: 박민수
(6, 3, 4, '카라멜 마키아또', 7000.00, 2, 14000.00, 'Venti, ICE, 휘핑크림'),
(7, 3, 8, '딸기 스무디', 7000.00, 1, 7000.00, 'Grande, 휘핑크림'),
(8, 3, 14, '티라미수', 6000.00, 1, 6000.00, NULL),

-- 주문 4: 정수진 (취소됨)
(9, 4, 1, '아메리카노', 4500.00, 1, 4500.00, 'Tall, HOT'),

-- 주문 5: 강혜진
(10, 5, 2, '카페라떼', 6500.00, 2, 13000.00, 'Grande, ICE, 바닐라시럽, 휘핑크림'),
(11, 5, 5, '바닐라 라떼', 6500.00, 1, 6500.00, 'Grande, HOT, 샷추가'),
(12, 5, 10, '크루아상', 3500.00, 2, 7000.00, NULL),
(13, 5, 12, '블루베리 머핀', 3800.00, 1, 3800.00, NULL),

-- 주문 6: 윤서준 (준비 중)
(14, 6, 7, '초코 라떼', 6200.00, 1, 6200.00, 'Grande, ICE, 휘핑크림'),
(15, 6, 11, '초코 머핀', 3800.00, 1, 3800.00, NULL),

-- 주문 7: 한지우 (생성됨)
(16, 7, 9, '망고 스무디', 7000.00, 1, 7000.00, 'Grande, 휘핑크림');

-- 12. 주문 아이템 옵션
INSERT INTO order_item_option (order_item_id, opt_item_id, opt_group_id, qty, price_delta) VALUES
-- order_item 1: 아메리카노 Grande ICE 샷추가
(1, 2, 1, 1, 500.00),   -- Grande
(1, 5, 2, 1, 0.00),     -- ICE
(1, 7, 3, 1, 500.00),   -- 샷 1개 추가

-- order_item 4: 카페라떼 Tall HOT 두유
(4, 1, 1, 1, 0.00),     -- Tall
(4, 4, 2, 1, 0.00),     -- HOT
(4, 18, 6, 1, 500.00),  -- 두유

-- order_item 6: 카라멜 마키아또 Venti ICE 휘핑크림
(6, 3, 1, 1, 1000.00),  -- Venti
(6, 5, 2, 1, 0.00),     -- ICE
(6, 13, 5, 1, 500.00),  -- 휘핑크림

-- order_item 7: 딸기 스무디 Grande 휘핑크림
(7, 2, 1, 1, 500.00),   -- Grande
(7, 13, 5, 1, 500.00),  -- 휘핑크림

-- order_item 9: 아메리카노 Tall HOT
(9, 1, 1, 1, 0.00),     -- Tall
(9, 4, 2, 1, 0.00),     -- HOT

-- order_item 10: 카페라떼 Grande ICE 바닐라시럽 휘핑크림
(10, 2, 1, 1, 500.00),  -- Grande
(10, 5, 2, 1, 0.00),    -- ICE
(10, 9, 4, 1, 500.00),  -- 바닐라 시럽
(10, 13, 5, 1, 500.00), -- 휘핑크림

-- order_item 11: 바닐라 라떼 Grande HOT 샷추가
(11, 2, 1, 1, 500.00),  -- Grande
(11, 4, 2, 1, 0.00),    -- HOT
(11, 7, 3, 1, 500.00),  -- 샷 1개 추가

-- order_item 14: 초코 라떼 Grande ICE 휘핑크림
(14, 2, 1, 1, 500.00),  -- Grande
(14, 5, 2, 1, 0.00),    -- ICE
(14, 13, 5, 1, 500.00), -- 휘핑크림

-- order_item 16: 망고 스무디 Grande 휘핑크림
(16, 2, 1, 1, 500.00),  -- Grande
(16, 13, 5, 1, 500.00); -- 휘핑크림

-- Sequence 업데이트 (다음 insert를 위해)
SELECT setval('stores_id_seq', (SELECT MAX(id) FROM stores));
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('products_id_seq', (SELECT MAX(id) FROM products));
SELECT setval('option_group_id_seq', (SELECT MAX(id) FROM option_group));
SELECT setval('option_item_id_seq', (SELECT MAX(id) FROM option_item));
SELECT setval('carts_id_seq', (SELECT MAX(id) FROM carts));
SELECT setval('cart_item_id_seq', (SELECT MAX(id) FROM cart_item));
SELECT setval('orders_id_seq', (SELECT MAX(id) FROM orders));
SELECT setval('order_item_id_seq', (SELECT MAX(id) FROM order_item));
