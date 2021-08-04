import React, { useState } from "react";

import ReviewForm from "./ReviewForm";
import ReviewList from "./ReviewList";

const Review = ({ reviewComments, currentUser, bookId }) => {
  const [reviews, setReviews] = useState(reviewComments);
  const [rating, setRating] = useState(0);

  return (
    <div className="border border-secondary p-2">
      {reviews.length == 0 ? <h2>No Reviews</h2> : <h2>Reviews</h2>}

      <ReviewList reviews={reviews} currentUser={currentUser} />

      {currentUser ? (
        <>
          <button
            className="btn btn-secondary"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target=".multi-collapse"
            aria-expanded="false"
            aria-controls="review form"
          >
            Add a Review
          </button>

          <br />

          <div className="collapse multi-collapse">
            <ReviewForm
              currentUser={currentUser}
              bookId={bookId}
              setReviews={setReviews}
              reviews={reviews}
              rating={rating}
              setRating={setRating}
            />
          </div>
        </>
      ) : (
        <>
          <button
            type="button"
            className="btn btn-secondary"
            data-bs-toggle="modal"
            data-bs-target="#LogInModal"
          >
            Add a Review
          </button>

          <div
            className="modal fade"
            id="LogInModal"
            tabindex="-1"
            aria-labelledby="LogInModalLabel"
            aria-hidden="true"
          >
            <div className="modal-dialog modal-dialog-centered">
              <div className="modal-content">
                <div className="modal-header">
                  <h4 className="modal-title" id="LogInModalLabel">
                    User Not Logged In
                  </h4>
                  <button
                    type="button"
                    className="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div className="modal-body">
                  <h5>To write a Review you must be Logged In first.</h5>
                  <a href="/users/sign_up" className="btn btn-secondary">
                    Log In
                  </a>
                </div>
              </div>
            </div>
          </div>
        </>
      )}
    </div>
  );
};

export default Review;
