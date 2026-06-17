import { useEffect, useState } from 'react';
import { QRCodeCanvas } from 'qrcode.react';
import { Navigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import { getUserPurchases } from '../../services/userService';
import './Profile.css';

function Profile() {
  const { user } = useAuth();

  const [purchases, setPurchases] = useState([]);
  const [error, setError] = useState('');

  useEffect(() => {
    const loadPurchases = async () => {
      if (!user) return;

      try {
        const data = await getUserPurchases(user.id_usuario);
        setPurchases(data.purchases);
      } catch (error) {
        setError(error.message);
      }
    };

    loadPurchases();
  }, [user]);

  if (!user) {
    return <Navigate to="/login" replace />;
  }

  return (
    <main className="profile-page">
      <section className="profile-container">
        <h1>Mi cuenta</h1>

        <section className="user-info-card">
          <h2>Datos del usuario</h2>

          <p><strong>Nombre:</strong> {user.nombre}</p>
          <p><strong>Apellido:</strong> {user.apellido}</p>
          <p><strong>Ciudad:</strong> {user.ciudad}</p>
          <p><strong>Gmail:</strong> {user.gmail}</p>
        </section>

        <section className="purchase-history">
          <h2>Historial de compras</h2>

          {error && <p className="profile-error">{error}</p>}

          {purchases.length === 0 ? (
            <p className="empty-history">
              Todavía no tienes compras registradas.
            </p>
          ) : (
            <div className="purchase-list">
              {purchases.map((purchase) => {
                const qrValue = `Compra: ${purchase.id_compra} | Pelicula: ${purchase.titulo} | Asientos: ${purchase.asientos.join(', ')}`;

                return (
                  <article className="purchase-card" key={purchase.id_compra}>
                    <img
                      src={purchase.poster}
                      alt={purchase.titulo}
                      className="purchase-poster"
                    />

                    <div className="purchase-info">
                      <h3>{purchase.titulo}</h3>

                      <p><strong>Ciudad:</strong> {purchase.ciudad}</p>
                      <p><strong>Formato:</strong> {purchase.formato}</p>
                      <p><strong>Horario:</strong> {purchase.horario}</p>
                      <p><strong>Fecha de compra:</strong> {purchase.fecha_compra}</p>
                      <p><strong>Butacas:</strong> {purchase.asientos.join(', ')}</p>
                      <p><strong>Cantidad:</strong> {purchase.cantidad_entradas}</p>
                      <p><strong>Precio unitario:</strong> Bs. {purchase.precio}</p>
                      <p><strong>Total:</strong> Bs. {purchase.total}</p>
                    </div>

                    <div className="purchase-qr">
                      <QRCodeCanvas
                        value={`Compra demo ${purchase.id_compra} - ${purchase.titulo}`}
                        size={115}
                      />
                      <span>QR de prueba</span>
                    </div>
                  </article>
                );
              })}
            </div>
          )}
        </section>
      </section>
    </main>
  );
}

export default Profile;