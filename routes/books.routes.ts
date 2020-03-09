import { Router } from "express";
import {
  addBook,
  addCategoryToBook,
  deleteBook,
  getBook,
  getBooks,
  listBookCastegories,
  listBookUsers,
  removeCategoryToBook,
  updateBook
} from "../controllers/books.controller";

const router = Router();

router
  .route("")
  .get(getBooks)
  .post(addBook);

router
  .route("/:id_book")
  .get(getBook)
  .delete(deleteBook)
  .put(updateBook);

router
  .route("/:id_book/category/:id_category")
  .post(addCategoryToBook)
  .delete(removeCategoryToBook);

router.route("/:id_book/users").get(listBookUsers);
router.route("/:id_book/categories").get(listBookCastegories);
export default router;
