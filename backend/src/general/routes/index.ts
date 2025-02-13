import express from 'express';

// Import route groups
import itemRoutes from './item';
import patientRoutes from './patient';
import userRoutes from './user';

const router = express.Router();

// Register route groups
const routes = [
  { path: '/users', router: userRoutes },
  { path: '/items', router: itemRoutes },
  { path: '/patients', router: patientRoutes }
];

// Dynamically register all routes
routes.forEach(({ path, router: routeGroup }) => {
  router.use(path, routeGroup);
});

export default router; 