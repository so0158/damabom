import { useState } from 'react';
import MenuCategory from './components/MenuCategory';
import MenuItem from './components/MenuItem';
import OptionSelector from './components/OptionSelector';
import Cart from './components/Cart';
import Payment from './components/Payment';
import { menuData } from './data/menu';

function App() {
  const [currentScreen, setCurrentScreen] = useState('category');
  const [selectedCategory, setSelectedCategory] = useState(null);
  const [selectedItem, setSelectedItem] = useState(null);
  const [cart, setCart] = useState([]);

  const handleCategorySelect = (category) => {
    setSelectedCategory(category);
    setCurrentScreen('menu');
  };

  const handleItemSelect = (item) => {
    setSelectedItem(item);
    setCurrentScreen('options');
  };

  const handleAddToCart = (itemWithOptions) => {
    const cartItem = {
      ...itemWithOptions,
      cartId: Date.now(),
    };
    setCart([...cart, cartItem]);
    setCurrentScreen('menu');
    setSelectedItem(null);
  };

  const handleRemoveFromCart = (cartId) => {
    setCart(cart.filter(item => item.cartId !== cartId));
  };

  const handleBackToCategory = () => {
    setCurrentScreen('category');
    setSelectedCategory(null);
  };

  const handleBackToMenu = () => {
    setCurrentScreen('menu');
    setSelectedItem(null);
  };

  const handleGoToCart = () => {
    setCurrentScreen('cart');
  };

  const handleGoToPayment = () => {
    setCurrentScreen('payment');
  };

  const handleBackToCartFromPayment = () => {
    setCurrentScreen('cart');
  };

  const handleCompletePayment = () => {
    alert('주문이 완료되었습니다!');
    setCart([]);
    setCurrentScreen('category');
    setSelectedCategory(null);
    setSelectedItem(null);
  };

  const getTotalAmount = () => {
    return cart.reduce((total, item) => total + item.totalPrice, 0);
  };

  return (
    <div className="app">
      <header className="header">
        <h1>카페 키오스크</h1>
        {cart.length > 0 && currentScreen !== 'cart' && currentScreen !== 'payment' && (
          <button className="cart-btn" onClick={handleGoToCart}>
            장바구니 ({cart.length})
          </button>
        )}
      </header>

      <main className="main-content">
        {currentScreen === 'category' && (
          <MenuCategory onSelectCategory={handleCategorySelect} />
        )}

        {currentScreen === 'menu' && (
          <MenuItem
            category={selectedCategory}
            items={menuData[selectedCategory].items}
            onSelectItem={handleItemSelect}
            onBack={handleBackToCategory}
          />
        )}

        {currentScreen === 'options' && (
          <OptionSelector
            item={selectedItem}
            onAddToCart={handleAddToCart}
            onBack={handleBackToMenu}
          />
        )}

        {currentScreen === 'cart' && (
          <Cart
            cart={cart}
            onRemoveItem={handleRemoveFromCart}
            onGoToPayment={handleGoToPayment}
            onBack={handleBackToCategory}
            totalAmount={getTotalAmount()}
          />
        )}

        {currentScreen === 'payment' && (
          <Payment
            cart={cart}
            totalAmount={getTotalAmount()}
            onBack={handleBackToCartFromPayment}
            onComplete={handleCompletePayment}
          />
        )}
      </main>
    </div>
  );
}

export default App;
