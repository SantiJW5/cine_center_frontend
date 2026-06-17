import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { registerRequest } from '../../services/authService';
import './Register.css';

function Register() {
  const navigate = useNavigate();

  const [formData, setFormData] = useState({
    nombre: '',
    apellido: '',
    ciudad: 'Cochabamba',
    gmail: '',
    contrasena: ''
  });

  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

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
    setSuccess('');

    try {
      await registerRequest(formData);

      setSuccess('Usuario registrado correctamente');

      setTimeout(() => {
        navigate('/login');
      }, 1000);
    } catch (error) {
      setError(error.message);
    }
  };

  return (
    <main className="auth-page">
      <form className="auth-card" onSubmit={handleSubmit}>
        <h2>Registrarse</h2>

        {error && <p className="auth-error">{error}</p>}
        {success && <p className="auth-success">{success}</p>}

        <label>Nombre</label>
        <input
          type="text"
          name="nombre"
          placeholder="Ej: Santiago"
          value={formData.nombre}
          onChange={handleChange}
        />

        <label>Apellido</label>
        <input
          type="text"
          name="apellido"
          placeholder="Ej: Rodríguez"
          value={formData.apellido}
          onChange={handleChange}
        />

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

        <label>Gmail</label>
        <input
          type="email"
          name="gmail"
          placeholder="ejemplo@gmail.com"
          value={formData.gmail}
          onChange={handleChange}
        />

        <label>Contraseña</label>
        <input
          type="password"
          name="contrasena"
          placeholder="Crea una contraseña"
          value={formData.contrasena}
          onChange={handleChange}
        />

        <button type="submit">Crear cuenta</button>
      </form>
    </main>
  );
}

export default Register;