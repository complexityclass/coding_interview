mod leetcode;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    fn test_length_of_longest_substring() {
        let s = String::from("pwwkew");
        let res = leetcode::strings::length_of_longest_substring(s);
        assert_eq!(res, 3);
    }
}
