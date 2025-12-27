import { useState } from 'react';

function Payment({ cart, totalAmount, onBack, onComplete }) {
  const [selectedPayment, setSelectedPayment] = useState(null);

  const paymentMethods = [
    { id: 'card', name: '카드 결제', icon: '💳' },
    { id: 'cash', name: '현금 결제', icon: '💵' },
    { id: 'mobile', name: '모바일 결제', icon: '📱' },
  ];

  const handlePayment = () => {
    if (!selectedPayment) {
      alert('결제 방법을 선택해주세요');
      return;
    }
    onComplete();
  };

  return (
    <div className="payment-container">
      <div className="screen-header">
        <button className="back-btn" onClick={onBack}>
          ← 뒤로
        </button>
        <h2 className="screen-title">결제</h2>
      </div>

      <div className="payment-content">
        <div className="order-summary">
          <h3 className="section-title">주문 내역</h3>
          <div className="order-items">
            {cart.map((item) => (
              <div key={item.cartId} className="order-item">
                <div className="order-item-info">
                  <span className="order-item-name">{item.name}</span>
                  <span className="order-item-quantity">x {item.quantity}</span>
                </div>
                <span className="order-item-price">
                  {item.totalPrice.toLocaleString()}원
                </span>
              </div>
            ))}
          </div>
          <div className="order-total">
            <span>총 결제금액</span>
            <span className="final-amount">{totalAmount.toLocaleString()}원</span>
          </div>
        </div>

        <div className="payment-methods">
          <h3 className="section-title">결제 방법</h3>
          <div className="payment-buttons">
            {paymentMethods.map((method) => (
              <button
                key={method.id}
                className={`payment-method-btn ${selectedPayment === method.id ? 'active' : ''}`}
                onClick={() => setSelectedPayment(method.id)}
              >
                <span className="payment-icon">{method.icon}</span>
                <span className="payment-name">{method.name}</span>
              </button>
            ))}
          </div>
        </div>

        <button className="complete-payment-btn" onClick={handlePayment}>
          결제하기
        </button>
      </div>
    </div>
  );
}

export default Payment;
