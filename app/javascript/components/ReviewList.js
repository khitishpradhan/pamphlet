import React from "react";

const ReviewList = ({ reviews }) => {
  return (
    <>
      {reviews.map((r, i) => (
        <div key={i}>
          <div className="d-flex align-items-center">
            <img
              src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUGXkn6Eo8eeiFv7O-1QEaenXwr_EcqmxtnQ&usqp=CAU"
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
