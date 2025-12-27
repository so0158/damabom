import { menuData } from '../data/menu';

function MenuCategory({ onSelectCategory }) {
  return (
    <div className="category-container">
      <h2 className="screen-title">카테고리를 선택하세요</h2>
      <div className="category-grid">
        {Object.keys(menuData).map((key) => (
          <button
            key={key}
            className="category-btn"
            onClick={() => onSelectCategory(key)}
          >
            {menuData[key].name}
          </button>
        ))}
      </div>
    </div>
  );
}

export default MenuCategory;
