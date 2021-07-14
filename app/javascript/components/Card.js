import React from "react"
import index from "../../assets/images/index.png"



const Card = ({book}) => {

return (
    <div className="col-lg-4 p-4 d-flex justify-content-center">
    <div className="card text-center shadow book_card" style={{width: "18rem"}}>

            {book.cover_i ? (
                <img src={`http://covers.openlibrary.org/b/id/${book.cover_i}-L.jpg`} className="card-img-top" />
            ) : (
                <img src={index} className="card-img-top" />
            )}
    
        <div className="card-body border-top" >

                <h6 className="card-title book_name">
                    {book.title}
                </h6>
        </div>
            <div className="card-footer bg-transparent border-0">

                { book.isbn ? (
                    <a href={`/book${book.key}/${book.isbn[0]}`} className="btn btn-secondary w-75">Learn More</a>
                ) : (
                    <button href="#" className="btn btn-secondary disabled w-75" disabled={true}>Resource not available</button>
                )}

            </div>

    </div>
</div>
)


}

export default Card;