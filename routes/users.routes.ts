import { Router } from "express";
import {
  addBookToUser,
  addUser,
  deleteUser,
  getUsers,
  getUser,
  listUserBooks,
  removeBookToUser,
  updateUser
} from "../controllers/users.controller";

const router = Router();

router
  .route("")
  .get(getUsers)
  .post(addUser);

router
  .route("/:id_user")
  .get(getUser)
  .delete(deleteUser)
  .put(updateUser);

router
  .route("/:id_user/book/:id_book")
  .post(addBookToUser)
  .delete(removeBookToUser);

router.route("/:id_user/books").get(listUserBooks);
export default router;
