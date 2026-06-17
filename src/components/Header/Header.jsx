import { Link } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import './Header.css';

function Header() {
  const { user, logout } = useAuth();

  return (
    <header className="navbar">
      <div className="logo">
        <img
          src="/img/cinecenterlogo.png"
          alt="Cine Center"
          className="logo-img"
        />
      </div>

      <nav className="menu">
        <Link to="/">Inicio</Link>
        <Link to="/">Cartelera</Link>
        <a href="#">Horarios</a>
      </nav>

      <div className="city-select">
        <select defaultValue="Cochabamba">
          <option>Cochabamba</option>
          <option>La Paz</option>
          <option>Santa Cruz</option>
        </select>
      </div>

      <div className="user-area">
        <span className="bell">🔔</span>

        {!user ? (
          <>
            <Link to="/register" className="register-button">
              Registrarse
            </Link>

            <Link to="/login" className="user-button">

              Iniciar sesión
            </Link>
          </>
        ) : (
          <>
            <Link to="/perfil" className="user-button">
              {user.nombre}
            </Link>

            <button className="logout-button" onClick={logout}>
              Cerrar Sesion
            </button>
          </>
        )}
      </div>
    </header>
  );
}

export default Header;