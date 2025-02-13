import express from 'express';
import { ItemController } from '../../controllers/itemController';

const router = express.Router();

router.get('/', ItemController.getAllItems);

export default router; 