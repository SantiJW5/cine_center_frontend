import express from 'express';
import { getUserPurchases } from '../controllers/user.controller.js';

const router = express.Router();

router.get('/:id_usuario/purchases', getUserPurchases);

export default router;