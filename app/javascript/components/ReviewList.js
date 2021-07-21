import React from "react";

const ReviewList = ({ reviews }) => {

  return (
    <>
      {reviews.map((r, i) => (
        <div key={i}>
          <div className="d-flex align-items-center">
            <img
              src={"https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"}
              alt="Avatar"
              className="avatar"
            />
            &nbsp;
            <div className="text-dark">{r.name || r.user.name}</div>
          </div>
          <div>
            {[...Array(parseInt(r.rating))].map((star, i) => (
              <i className="fas fa-star star-rating" key={i}></i>
            ))}
          </div>
          <p className="review_comment fw-light text-secondary">{r.review}</p>
        </div>
      ))}
    </>
  );
};

export default ReviewList;
