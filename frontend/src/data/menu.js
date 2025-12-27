export const menuData = {
  coffee: {
    name: '커피',
    items: [
      { id: 1, name: '아메리카노', price: 4000, image: '☕' },
      { id: 2, name: '카페라떼', price: 4500, image: '☕' },
      { id: 3, name: '카푸치노', price: 4500, image: '☕' },
      { id: 4, name: '카라멜 마키아또', price: 5000, image: '☕' },
    ]
  },
  beverage: {
    name: '음료',
    items: [
      { id: 5, name: '녹차라떼', price: 4500, image: '🍵' },
      { id: 6, name: '초코라떼', price: 4500, image: '🍫' },
      { id: 7, name: '딸기라떼', price: 5000, image: '🍓' },
      { id: 8, name: '레몬에이드', price: 4500, image: '🍋' },
    ]
  },
  dessert: {
    name: '디저트',
    items: [
      { id: 9, name: '크로와상', price: 3500, image: '🥐' },
      { id: 10, name: '치즈케이크', price: 5500, image: '🍰' },
      { id: 11, name: '마들렌', price: 3000, image: '🧁' },
      { id: 12, name: '쿠키', price: 2500, image: '🍪' },
    ]
  }
};

export const sizeOptions = [
  { id: 'small', name: '스몰', price: 0 },
  { id: 'medium', name: '미디엄', price: 500 },
  { id: 'large', name: '라지', price: 1000 },
];

export const temperatureOptions = [
  { id: 'hot', name: 'HOT' },
  { id: 'ice', name: 'ICE' },
];

export const extraOptions = [
  { id: 'shot', name: '샷 추가', price: 500 },
  { id: 'syrup', name: '시럽 추가', price: 500 },
  { id: 'whip', name: '휘핑크림', price: 500 },
];
