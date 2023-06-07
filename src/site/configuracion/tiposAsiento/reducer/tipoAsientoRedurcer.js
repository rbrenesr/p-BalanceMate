// const initialState = [{
//     id: 1,
//     todo: 'Primer todo',
//     done: false
// }];

// const newTodo = {
//     id: 2,
//     todo: 'Segundo todo',
//     done: false
// };


// const addTodoAction = {
//     type: '[TODO] add todo',
//     payload: newTodo
// }

export const tipoAsientoReducer = (initialState, action) => {
    
    switch (action.type) {
        case '[TODO] Add':
            return [...initialState, action.payload];

        case '[TODO] Delete':
            return initialState.filter(todo => todo.id !== action.payload);

        default:
            return initialState;
    }

}