import { menuData } from '../data/menu';

function MenuItem({ category, items, onSelectItem, onBack }) {
  return (
    <div className="menu-container">
      <div className="screen-header">
        <button className="back-btn" onClick={onBack}>
          ← 뒤로
        </button>
        <h2 className="screen-title">{menuData[category].name}</h2>
      </div>

      <div className="menu-grid">
        {items.map((item) => (
          <button
            key={item.id}
            className="menu-item-btn"
            onClick={() => onSelectItem(item)}
          >
            <div className="menu-item-image">{item.image}</div>
            <div className="menu-item-name">{item.name}</div>
            <div className="menu-item-price">{item.price.toLocaleString()}원</div>
          </button>
        ))}
      </div>
    </div>
  );
}

export default MenuItem;
