import express from 'express';
import createUser from './createUser';
import deleteUser from './deleteUser';
import getAllUsers from './getAllUsers';
import getUserById from './getUserById';
import updateUser from './updateUser';

const router = express.Router();

// Register all user routes
router.post('/', createUser);
router.get('/', getAllUsers);
router.get('/:id', getUserById);
router.put('/:id', updateUser);
router.delete('/:id', deleteUser);

export default router; 