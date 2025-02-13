import express from 'express';
import { UserController } from '../../controllers/userController';

const router = express.Router();

router.delete('/:id', UserController.deleteUser);

export default router; 