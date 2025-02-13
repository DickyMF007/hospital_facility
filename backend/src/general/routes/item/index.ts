import express from 'express';
import createItem from './createItem';
import deleteItem from './deleteItem';
import getAllItems from './getAllItems';
import getItemById from './getItemById';
import updateItem from './updateItem';

const router = express.Router();

// Register all item routes
router.post('/', createItem);
router.get('/', getAllItems);
router.get('/:id', getItemById);
router.put('/:id', updateItem);
router.delete('/:id', deleteItem);

export default router; 