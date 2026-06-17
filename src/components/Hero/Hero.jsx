import { useEffect, useState } from 'react';
import { heroSlides } from '../../data/heroSlides';
import './Hero.css';

function Hero() {
  const [currentIndex, setCurrentIndex] = useState(0);

  const currentSlide = heroSlides[currentIndex];

  const goToPrevious = () => {
    const isFirstSlide = currentIndex === 0;
    const newIndex = isFirstSlide ? heroSlides.length - 1 : currentIndex - 1;

    setCurrentIndex(newIndex);
  };

  const goToNext = () => {
    const isLastSlide = currentIndex === heroSlides.length - 1;
    const newIndex = isLastSlide ? 0 : currentIndex + 1;

    setCurrentIndex(newIndex);
  };

  const goToSlide = (index) => {
    setCurrentIndex(index);
  };

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentIndex((previousIndex) => {
        const isLastSlide = previousIndex === heroSlides.length - 1;
        return isLastSlide ? 0 : previousIndex + 1;
      });
    }, 5000);

    return () => clearInterval(interval);
  }, []);

  return (
    <section
      className="hero"
      style={{
        backgroundImage: `
          linear-gradient(
            rgba(0, 0, 0, 0.45),
            rgba(0, 0, 0, 0.45)
          ),
          url(${currentSlide.image})
        `
      }}
    >
      <button className="slider-arrow left" onClick={goToPrevious}>
        ‹
      </button>

      <button className="slider-arrow right" onClick={goToNext}>
        ›
      </button>

      <div className="hero-dots">
        {heroSlides.map((slide, index) => (
          <button
            key={slide.id}
            className={index === currentIndex ? 'dot active' : 'dot'}
            onClick={() => goToSlide(index)}
          ></button>
        ))}
      </div>
    </section>
  );
}

export default Hero;