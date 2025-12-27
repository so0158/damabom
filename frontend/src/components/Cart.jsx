function Cart({ cart, onRemoveItem, onGoToPayment, onBack, totalAmount }) {
  return (
    <div className="cart-container">
      <div className="screen-header">
        <button className="back-btn" onClick={onBack}>
          ← 뒤로
        </button>
        <h2 className="screen-title">장바구니</h2>
      </div>

      {cart.length === 0 ? (
        <div className="empty-cart">
          <p>장바구니가 비어있습니다</p>
        </div>
      ) : (
        <>
          <div className="cart-items">
            {cart.map((item) => (
              <div key={item.cartId} className="cart-item">
                <div className="cart-item-info">
                  <div className="cart-item-image">{item.image}</div>
                  <div className="cart-item-details">
                    <div className="cart-item-name">{item.name}</div>
                    <div className="cart-item-options">
                      {item.size.name} / {item.temperature.name}
                      {item.extras.length > 0 && (
                        <span> / {item.extras.map(e => e.name).join(', ')}</span>
                      )}
                    </div>
                    <div className="cart-item-quantity">수량: {item.quantity}</div>
                  </div>
                </div>
                <div className="cart-item-actions">
                  <div className="cart-item-price">
                    {item.totalPrice.toLocaleString()}원
                  </div>
                  <button
                    className="remove-btn"
                    onClick={() => onRemoveItem(item.cartId)}
                  >
                    삭제
                  </button>
                </div>
              </div>
            ))}
          </div>

          <div className="cart-summary">
            <div className="cart-total">
              <span>총 금액</span>
              <span className="total-amount">{totalAmount.toLocaleString()}원</span>
            </div>
            <button className="payment-btn" onClick={onGoToPayment}>
              결제하기
            </button>
          </div>
        </>
      )}
    </div>
  );
}

export default Cart;
