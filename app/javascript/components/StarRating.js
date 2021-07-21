import React, { useState } from "react";

const StarRating = ({rating, handleRating}) => {
  
  const [hover, setHover] = useState(null);

  const handleClick = (e) => {
    handleRating(e.target.value)
  }

  return (
    <div>
      <h5>Rate the book</h5>

      {[...Array(5)].map((star, i) => {
        const ratingValue = i + 1;
        return (
          <label key={i}>
            <input
              className="starRadio"
              id={`review_rating_${ratingValue}`}
              type="radio"
              value={ratingValue}
              name="review[rating]"
              onChange={handleClick}
            />
            <i
              className="fas fa-star"
              onMouseEnter={() => setHover(ratingValue)}
              onMouseLeave={() => setHover(null)}
              style={{
                color: ratingValue <= (hover || rating) ? "#d6b853" : "#bebebe",
              }}
            ></i>
          </label>
        );
      })}
    </div>
  );
};

export default StarRating;
