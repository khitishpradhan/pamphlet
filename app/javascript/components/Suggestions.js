import React from "react"
import Card from "./Card"

const Suggestions = ({books, author}) => {


    return (
        <div className="col-sm-12 suggestions_card">
            {books.length !==0 ? (
                <>
                    <h3>{`Here are some books written by ${author} you might like`}</h3>

                    <div className="card-group">

                            {books.map((book, i) => (
                                <Card book={book} key={i}/>
                            ))}

                    </div>
                </>
                
            ) : (
                <h1>No Suggestions</h1>
            )}
            

        </div>
    )
}

export default Suggestions;