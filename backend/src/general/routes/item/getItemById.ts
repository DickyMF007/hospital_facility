import express from 'express';
import { ItemController } from '../../controllers/itemController';

const router = express.Router();

router.get('/:id', ItemController.getItemById);

export default router; 