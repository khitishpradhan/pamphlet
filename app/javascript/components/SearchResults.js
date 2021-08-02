import React from 'react'

import Card from "./Card"


const SearchResults = ({books, query}) => {
    return (
        <div className= "container text-center" >

            {books.length !==0 ? (
                <>
                    <h1>{`Showing results for "${query}"`}</h1>

                    <div className="row">
                        <div className="col" >
                            <div className="card-group">

                            {
                                books.map((book, i) => (
                                    <Card book = {book} key={i} />
                                ))
                            }
                                
                            </div>
                        </div>    
                    </div>
                </>
                
            ) : (
                <h1>No results found </h1>
            )}
            


        </div>
    )
}

export default SearchResults
