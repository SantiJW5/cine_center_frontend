import { Link } from 'react-router-dom';
import './MovieCard.css';

function MovieCard({ movie }) {
  return (
    <Link to={`/pelicula/${movie.slug}`} className="movie-card">
      {movie.estreno && <span className="tag">ESTRENO</span>}

      {movie.image ? (
        <img src={movie.image} alt={movie.title} />
      ) : (
        <div className="empty-poster">
          <span>{movie.title}</span>
        </div>
      )}
    </Link>
  );
}

export default MovieCard;