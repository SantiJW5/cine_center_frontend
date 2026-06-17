const PURCHASES_KEY = 'cine_purchases';

export const getUserPurchases = async (userId) => {
  const purchases = JSON.parse(localStorage.getItem(PURCHASES_KEY)) || [];

  const userPurchases = purchases.filter(
    (purchase) => purchase.id_usuario === userId
  );

  return {
    purchases: userPurchases
  };
};