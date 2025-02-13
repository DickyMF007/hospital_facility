import express from 'express';
import { UserController } from '../../controllers/userController';

const router = express.Router();

router.put('/:id', UserController.updateUser);

export default router; 