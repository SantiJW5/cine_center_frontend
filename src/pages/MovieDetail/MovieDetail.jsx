import { useState } from 'react';
import { useParams, Navigate, useNavigate } from 'react-router-dom';
import { movies } from '../../data/movies';
import './MovieDetail.css';

function MovieDetail() {
  const { slug } = useParams();
  const navigate = useNavigate();
  const movie = movies.find((item) => item.slug === slug);

  const [selectedFormat, setSelectedFormat] = useState('');
  const [selectedTime, setSelectedTime] = useState('');

  if (!movie) {
    return <Navigate to="/" replace />;
  }

  const handleFormatSelect = (format) => {
    setSelectedFormat(format);
  };

  const handleTimeSelect = (time) => {
    setSelectedTime(time);
  };
  const handleBuyTickets = () => {
    navigate(`/compra/${movie.slug}`, {
      state: {
        movie,
        selectedFormat,
        selectedTime
      }
    });
  };
  const showBuyButton = selectedFormat && selectedTime;

  return (
    <main className="movie-detail-page">
      <section className="movie-detail-container">

        <div className="movie-top">
          <div className="movie-poster-box">
            <img
              src={movie.poster}
              alt={movie.title}
              className="movie-detail-poster"
            />
          </div>

          <div className="movie-trailer-box">
            <iframe
              src={movie.trailer}
              title={`Trailer de ${movie.title}`}
              allowFullScreen
            ></iframe>
          </div>
        </div>

        <section className="movie-info">
          <h1>{movie.title}</h1>

          <p><strong>Género:</strong> {movie.genre}</p>
          <p><strong>Duración:</strong> {movie.duration}</p>

          <span className="age-badge">{movie.age}</span>

          <button className="synopsis-button">
            Sinopsis
          </button>

          <p className="synopsis-text">
            {movie.synopsis}
          </p>
        </section>

        <section className="movie-dates">
          <button className="date-arrow">‹</button>

          <div className="dates-list">
            {movie.dates.map((date) => (
              <div
                key={`${date.day}-${date.number}`}
                className={date.active ? 'date-card active' : 'date-card'}
              >
                <span>{date.day}</span>
                <strong>{date.number}</strong>
                <small>{date.month}</small>
              </div>
            ))}
          </div>

          <button className="date-arrow">›</button>
        </section>

        <div className="separator"></div>

        <section className="movie-formats">
          <h2>Formatos</h2>

          <div className="formats-list">
            {movie.formats.map((format) => (
              <button
                key={format}
                onClick={() => handleFormatSelect(format)}
                className={selectedFormat === format ? 'active' : ''}
              >
                {format}
              </button>
            ))}
          </div>
        </section>

        <section className="movie-times">
          <h2>Horarios</h2>

          <div className="times-list">
            {movie.times.map((time) => (
              <button
                key={time}
                onClick={() => handleTimeSelect(time)}
                className={selectedTime === time ? 'active' : ''}
              >
                {time}
              </button>
            ))}

            
          </div>

          {showBuyButton && (
            <div className="buy-ticket-container">
              <p>
                Formato seleccionado: <strong>{selectedFormat}</strong>
              </p>

              <p>
                Horario seleccionado: <strong>{selectedTime}</strong>
              </p>

              <button className="buy-ticket-button" onClick={handleBuyTickets}>
                Comprar entradas
              </button>
            </div>
          )}
        </section>

      </section>
    </main>
  );
}

export default MovieDetail;