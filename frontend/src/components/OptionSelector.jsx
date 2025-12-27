import { useState } from 'react';
import { sizeOptions, temperatureOptions, extraOptions } from '../data/menu';

function OptionSelector({ item, onAddToCart, onBack }) {
  const [selectedSize, setSelectedSize] = useState(sizeOptions[0]);
  const [selectedTemp, setSelectedTemp] = useState(temperatureOptions[0]);
  const [selectedExtras, setSelectedExtras] = useState([]);
  const [quantity, setQuantity] = useState(1);

  const handleExtraToggle = (extra) => {
    if (selectedExtras.find(e => e.id === extra.id)) {
      setSelectedExtras(selectedExtras.filter(e => e.id !== extra.id));
    } else {
      setSelectedExtras([...selectedExtras, extra]);
    }
  };

  const calculateTotalPrice = () => {
    const basePrice = item.price;
    const sizePrice = selectedSize.price;
    const extrasPrice = selectedExtras.reduce((sum, extra) => sum + extra.price, 0);
    return (basePrice + sizePrice + extrasPrice) * quantity;
  };

  const handleAddToCart = () => {
    const itemWithOptions = {
      ...item,
      size: selectedSize,
      temperature: selectedTemp,
      extras: selectedExtras,
      quantity,
      totalPrice: calculateTotalPrice(),
    };
    onAddToCart(itemWithOptions);
  };

  return (
    <div className="options-container">
      <div className="screen-header">
        <button className="back-btn" onClick={onBack}>
          ← 뒤로
        </button>
        <h2 className="screen-title">{item.name}</h2>
      </div>

      <div className="options-content">
        <div className="option-section">
          <h3 className="option-title">사이즈</h3>
          <div className="option-buttons">
            {sizeOptions.map((size) => (
              <button
                key={size.id}
                className={`option-btn ${selectedSize.id === size.id ? 'active' : ''}`}
                onClick={() => setSelectedSize(size)}
              >
                {size.name}
                {size.price > 0 && ` (+${size.price}원)`}
              </button>
            ))}
          </div>
        </div>

        <div className="option-section">
          <h3 className="option-title">온도</h3>
          <div className="option-buttons">
            {temperatureOptions.map((temp) => (
              <button
                key={temp.id}
                className={`option-btn ${selectedTemp.id === temp.id ? 'active' : ''}`}
                onClick={() => setSelectedTemp(temp)}
              >
                {temp.name}
              </button>
            ))}
          </div>
        </div>

        <div className="option-section">
          <h3 className="option-title">추가 옵션</h3>
          <div className="option-buttons">
            {extraOptions.map((extra) => (
              <button
                key={extra.id}
                className={`option-btn ${selectedExtras.find(e => e.id === extra.id) ? 'active' : ''}`}
                onClick={() => handleExtraToggle(extra)}
              >
                {extra.name} (+{extra.price}원)
              </button>
            ))}
          </div>
        </div>

        <div className="option-section">
          <h3 className="option-title">수량</h3>
          <div className="quantity-controls">
            <button
              className="quantity-btn"
              onClick={() => setQuantity(Math.max(1, quantity - 1))}
            >
              -
            </button>
            <span className="quantity-display">{quantity}</span>
            <button
              className="quantity-btn"
              onClick={() => setQuantity(quantity + 1)}
            >
              +
            </button>
          </div>
        </div>
      </div>

      <div className="add-to-cart-section">
        <div className="total-price">
          총 금액: {calculateTotalPrice().toLocaleString()}원
        </div>
        <button className="add-to-cart-btn" onClick={handleAddToCart}>
          장바구니 담기
        </button>
      </div>
    </div>
  );
}

export default OptionSelector;
