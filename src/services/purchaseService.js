const PURCHASES_KEY = 'cine_purchases';

export const createPurchase = async (purchaseData) => {
  const purchases = JSON.parse(localStorage.getItem(PURCHASES_KEY)) || [];

  const newPurchase = {
    id_compra: Date.now(),
    id_usuario: purchaseData.id_usuario,
    movieSlug: purchaseData.movieSlug,
    titulo: purchaseData.movie.title,
    poster: purchaseData.movie.poster,
    ciudad: purchaseData.movie.ciudad || 'Cochabamba',
    formato: purchaseData.selectedFormat,
    horario: purchaseData.selectedTime,
    asientos: purchaseData.selectedSeats,
    cantidad_entradas: purchaseData.selectedSeats.length,
    precio: purchaseData.ticketPrice,
    total: purchaseData.total,
    fecha_compra: new Date().toLocaleString()
  };

  purchases.push(newPurchase);

  localStorage.setItem(PURCHASES_KEY, JSON.stringify(purchases));

  return {
    message: 'Compra simulada correctamente',
    purchase: newPurchase
  };
};