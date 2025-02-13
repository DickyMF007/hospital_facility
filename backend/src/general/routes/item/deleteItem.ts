import express from 'express';
import { ItemController } from '../../controllers/itemController';

const router = express.Router();

router.delete('/:id', ItemController.deleteItem);

export default router; 