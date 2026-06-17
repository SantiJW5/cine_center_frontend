import Hero from '../../components/Hero/Hero';
import FormatFilter from '../../components/FormatFilter/FormatFilter';
import MovieCard from '../../components/MovieCard/MovieCard';
import { movies } from '../../data/movies';
import './Cartelera.css';

function Cartelera() {
  return (
    <>
      <Hero />

      <FormatFilter />

      <main className="movies-section">
        <div className="movies-grid">
          {movies.map((movie) => (
            <MovieCard 
              key={movie.id} 
              movie={movie} 
            />
          ))}
        </div>
      </main>
    </>
  );
}

export default Cartelera;