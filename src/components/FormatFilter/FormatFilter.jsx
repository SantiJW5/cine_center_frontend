import './FormatFilter.css';

function FormatFilter() {
  const formats = [
    'Todos los formatos',
    '2D',
    '3D',
    '4D E-Motion 3D',
    '2D CXC',
    '2D CXC Atmos',
    '2D Atmos',
    '4D E-Motion 2D'
  ];

  return (
    <section className="cartelera-section">
      <div className="cartelera-container">
        <h2>Cartelera</h2>

        <p>Selecciona un formato:</p>

        <div className="formatos">
          {formats.map((format, index) => (
            <button
              key={format}
              className={index === 0 ? 'active' : ''}
            >
              {format}
            </button>
          ))}
        </div>
      </div>
    </section>
  );
}

export default FormatFilter;