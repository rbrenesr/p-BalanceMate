import { useDispatch, useSelector } from 'react-redux';

import {    
    isLoading,
    
    onLoading,
} from '../store/mainSlice';


export const useMainStore = () => {
    const dispatch = useDispatch();

    const { isLoading } = useSelector(state => state.main);

    async function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    const selectReport = async () => {
        dispatch(onLoading(true));
        await sleep(1000);
        dispatch(onLoading(false));
    }

    return {
        isLoading,

        selectReport,
    }

}
