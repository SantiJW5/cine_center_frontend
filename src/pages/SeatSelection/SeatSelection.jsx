import { useState } from 'react';
import { useLocation, useNavigate, Navigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import { createPurchase } from '../../services/purchaseService';
import './SeatSelection.css';

const rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M'];
const seatsPerRow = 26;

function getSeatStatus(row, number) {
  const unavailableSeats = [
    'A26', 'A25', 'A24', 'A23',
    'A4', 'A3', 'A2', 'A1',
    'I26',
    'J26',
    'K26',
    'L22', 'L21', 'L20', 'L19'
  ];

  const specialSeats = ['A14', 'A13'];
  const seatCode = `${row}${number}`;

  if (unavailableSeats.includes(seatCode)) return 'unavailable';
  if (specialSeats.includes(seatCode)) return 'special';

  return 'available';
}

function getPriceFromTime(time) {
  if (!time) return 0;

  const match = time.match(/(\d+)\s*Bs/);
  return match ? Number(match[1]) : 0;
}

function SeatSelection() {
  const location = useLocation();
  const navigate = useNavigate();
  const { user } = useAuth();

  const data = location.state;

  const [selectedSeats, setSelectedSeats] = useState([]);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  if (!data) {
    return <Navigate to="/" replace />;
  }

  const { movie, selectedFormat, selectedTime } = data;

  const ticketPrice = getPriceFromTime(selectedTime);
  const total = selectedSeats.length * ticketPrice;

  const toggleSeat = (seatCode, status) => {
    if (status === 'unavailable' || status === 'special') {
      return;
    }

    setSelectedSeats((currentSeats) => {
      if (currentSeats.includes(seatCode)) {
        return currentSeats.filter((seat) => seat !== seatCode);
      }

      return [...currentSeats, seatCode];
    });
  };

 const handleFinalPurchase = async () => {
  setError('');
  setSuccess('');

  if (selectedSeats.length === 0) {
    setError('Debes seleccionar al menos una butaca');
    return;
  }

  try {
    await createPurchase({
      id_usuario: user.id_usuario,
      movieSlug: movie.slug,
      movie,
      selectedFormat,
      selectedTime,
      selectedSeats,
      ticketPrice,
      total
    });

      setSuccess('Compra realizada correctamente');

      setTimeout(() => {
        navigate('/perfil');
      }, 1000);

    } catch (error) {
      setError(error.message);
    }
  };

  return (
    <main className="seat-page">
      <button className="back-button" onClick={() => navigate(-1)}>
        ←
      </button>

      <section className="seat-map-container">
        <div className="screen">
          <span>Pantalla</span>
        </div>

        <div className="seat-numbers top">
          {Array.from({ length: seatsPerRow }, (_, index) => (
            <span key={index}>{seatsPerRow - index}</span>
          ))}
        </div>

        <div className="seat-grid">
          {rows.map((row) => (
            <div className="seat-row" key={row}>
              <span className="row-label">{row}</span>

              <div className="seat-row-center">
                {Array.from({ length: seatsPerRow }, (_, index) => {
                  const seatNumber = seatsPerRow - index;
                  const seatCode = `${row}${seatNumber}`;
                  const status = getSeatStatus(row, seatNumber);
                  const isSelected = selectedSeats.includes(seatCode);

                  return (
                    <button
                      key={seatCode}
                      className={`seat ${status} ${isSelected ? 'selected' : ''}`}
                      onClick={() => toggleSeat(seatCode, status)}
                      title={seatCode}
                    ></button>
                  );
                })}
              </div>

              <span className="row-label">{row}</span>
            </div>
          ))}
        </div>

        <div className="seat-numbers bottom">
          {Array.from({ length: seatsPerRow }, (_, index) => (
            <span key={index}>{seatsPerRow - index}</span>
          ))}
        </div>

        <div className="seat-legend">
          <div><span className="legend-box available"></span>Disponible</div>
          <div><span className="legend-box selected"></span>Seleccionado</div>
          <div><span className="legend-box special"></span>Especial</div>
          <div><span className="legend-box occupied"></span>Ocupado</div>
          <div><span className="legend-box unavailable"></span>No Disponible</div>
        </div>
      </section>

      <section className="purchase-summary">
        <h1>Ciudad: Cochabamba</h1>

        <div className="summary-card">
          <div>
            <h3>Resumen de Compra</h3>
            <p><strong>Película:</strong> {movie.title}</p>
            <p><strong>Formato:</strong> {selectedFormat}</p>
            <p><strong>Horario:</strong> {selectedTime}</p>
            <p><strong>Asientos seleccionados:</strong> {selectedSeats.join(', ') || 'Ninguno'}</p>
            <p><strong>Cantidad de entradas:</strong> {selectedSeats.length}</p>
          </div>

          <h2>Total Bs. {total.toFixed(2)}</h2>
        </div>

        <button className="final-buy-button" onClick={handleFinalPurchase}>
          🎟 Comprar entradas
        </button>

        {error && <p className="seat-error">{error}</p>}
        {success && <p className="seat-success">{success}</p>}
      </section>
    </main>
  );
}

export default SeatSelection;