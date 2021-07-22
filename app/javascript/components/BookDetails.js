import React from "react"

import index from "../../assets/images/index.png"



const BookDetails = ({book, preview, author}) => {


    return (
    <div className="row">
		<div className="col-sm-3 d-flex flex-column justify-content-center text-center py-2">
           {book.covers? (
			<img src={`http://covers.openlibrary.org/b/id/${book.covers[0]}-L.jpg`} className="book_image" />
		   ) : (
			<img src={index} className="book_image" />
		   )}

		   {preview? (
			   <div>
			   		<a href={`#${preview}`} className="btn btn-secondary preview_btn">Preview</a>
			   </div>
		   ) : (
			<button className="btn btn-secondary preview_btn disabled" href="#" disabled={true}>Resource not available</button>
		   )}

		</div>
		<div className="col-sm-9 py-2">
			<h1>{book.title}</h1>
			{author? (
				<h6>by {author}</h6>
			) : (
				<h6>author information not available</h6>
			)}
			
			<h2 className="text-secondary text-wrap">Overview</h2>

			<div className="overview">
				{book.description? (
					<p>{book.description.value || book.description}</p>
				) : (
					<p>No Overview available</p>	
				)}
			</div>		

		</div>
	</div>
    )


}

export default BookDetails;