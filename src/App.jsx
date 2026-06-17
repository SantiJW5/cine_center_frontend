import { Routes, Route } from 'react-router-dom';

import Header from './components/Header/Header';
import Cartelera from './pages/Cartelera/Cartelera';
import Login from './pages/Login/Login';
import Register from './pages/Register/Register';
import MovieDetail from './pages/MovieDetail/MovieDetail';
import ProtectedRoute from './components/ProtectedRoute/ProtectedRoute';
import WhatsappButton from './components/WhatsappButton/WhatsappButton';
import SeatSelection from './pages/SeatSelection/SeatSelection';
import Profile from './pages/Profile/Profile';

import './App.css';

function App() {
  return (
    <div className="app">
      <Header />

      <Routes>
        <Route path="/" element={<Cartelera />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />

        <Route
          path="/perfil"
          element={
            <ProtectedRoute>
              <Profile />
            </ProtectedRoute>
          }
        />

        <Route
          path="/pelicula/:slug"
          element={
            <ProtectedRoute>
              <MovieDetail />
            </ProtectedRoute>
          }
        />
        <Route
          path="/compra/:slug"
          element={
            <ProtectedRoute>
              <SeatSelection />
            </ProtectedRoute>
          }
        />
      </Routes>

      <WhatsappButton />
    </div>
  );
}

export default App;