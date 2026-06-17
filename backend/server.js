import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import userRoutes from './routes/user.routes.js';
import authRoutes from './routes/auth.routes.js';
import purchaseRoutes from './routes/purchase.routes.js';

dotenv.config({ path: './backend/.env' });

const app = express();

app.use(cors());
app.use(express.json());
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/purchases', purchaseRoutes);

const PORT = process.env.PORT || 3001;

app.listen(PORT, () => {
  console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
});