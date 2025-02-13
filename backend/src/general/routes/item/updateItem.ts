import express from 'express';
import { ItemController } from '../../controllers/itemController';

const router = express.Router();

router.put('/:id', ItemController.updateItem);

export default router; 