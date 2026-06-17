import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { loginRequest } from '../../services/authService';
import { useAuth } from '../../context/AuthContext';
import './Login.css';

function Login() {
  const navigate = useNavigate();
  const { login } = useAuth();

  const [formData, setFormData] = useState({
    ciudad: 'Cochabamba',
    nombre: '',
    contrasena: ''
  });

  const [error, setError] = useState('');

  const handleChange = (event) => {
    const { name, value } = event.target;

    setFormData({
      ...formData,
      [name]: value
    });
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    setError('');

    try {
      const data = await loginRequest(formData);

      login(data.user);

      navigate('/');
    } catch (error) {
      setError(error.message);
    }
  };

  return (
    <main className="auth-page">
      <form className="auth-card" onSubmit={handleSubmit}>
        <h2>Iniciar sesión</h2>

        {error && <p className="auth-error">{error}</p>}

        <label>Ciudad</label>
        <select
          name="ciudad"
          value={formData.ciudad}
          onChange={handleChange}
        >
          <option>Cochabamba</option>
          <option>La Paz</option>
          <option>Santa Cruz</option>
        </select>

        <label>Nombre</label>
        <input
          type="text"
          name="nombre"
          placeholder="Ej: Santiago"
          value={formData.nombre}
          onChange={handleChange}
        />

        <label>Contraseña</label>
        <input
          type="password"
          name="contrasena"
          placeholder="Ingresa tu contraseña"
          value={formData.contrasena}
          onChange={handleChange}
        />

        <button type="submit">Entrar</button>
      </form>
    </main>
  );
}

export default Login;