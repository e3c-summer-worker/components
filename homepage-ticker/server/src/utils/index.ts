// ges pairwise elements of a list
const pairwise = <T>(arr: Array<T>): Array<[T, T]> => {
    return arr.reduce((acc, curr, idx) => {
        if (idx < arr.length - 1) {
            acc.push([curr, arr[idx + 1]])
        }
        return acc
    }, [])
}

export { pairwise }