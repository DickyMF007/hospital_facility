import express from 'express';
import { ItemController } from '../../controllers/itemController';

const router = express.Router();

router.post('/', ItemController.createItem);

export default router; 