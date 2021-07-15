import React, { useState } from "react";
import StarRating from "./StarRating";

const ReviewForm = ({ currentUser, bookId, setReviews, reviews, rating, setRating}) => {
  const [reviewComment, setReviewComment] = useState("");
  

  const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

  const review = {"book_id" : `${bookId}`, "user_id" : currentUser.id, "review" : `${reviewComment}`, "rating": rating, "name" : currentUser.name }

  const data = {"review":{"book_id" : `${bookId}`, "user_id" : `${currentUser.id}`, "review" : `${reviewComment}`, "rating": `${rating}` }}


  const handleSubmit = (e) => {

    e.preventDefault()

    fetch("/reviews",{
      method: "POST",
    
      headers: {
    
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json",
    
      },
    
      body: JSON.stringify(data),
    
    });

    setReviews([...reviews, review])

    setReviewComment("")
    setRating(0)

  }


  return (
    <div>
      <form
        onSubmit={handleSubmit}
        className="new_review"
        id="new_review"
        method="post"
        acceptCharset="UTF-8"
      >
        <input
          value={bookId}
          id="review_book_id"
          type="hidden"
          name="review[book_id]"
        />
        <input
          value={currentUser.id}
          id="review_user_id"
          type="hidden"
          name="review[user_id]"
        />

        <StarRating rating={rating} setRating={setRating} />
        <br/>

        <textarea
          className="form-control me-2"
          placeholder="Write a Review"
          name="review[review]"
          value={reviewComment}
          onChange={(e) => setReviewComment(e.target.value)}
        />
        <br />
        <input
          type="submit"
          value="Post"
          className="btn btn-outline-secondary"
        />
      </form>
    </div>
  );
};

export default ReviewForm;
