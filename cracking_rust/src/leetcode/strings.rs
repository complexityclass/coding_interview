use std::collections::HashSet;

#[allow(dead_code)]
pub fn length_of_longest_substring(s: String) -> i32 {
    let mut hs = HashSet::new();
    let mut a_ptr = 0;
    let mut b_ptr = 0;
    let mut max_length = 0;
    while b_ptr < s.len() {
        if !hs.contains(&s.chars().nth(b_ptr)) {
            hs.insert(s.chars().nth(b_ptr));
            b_ptr += 1;
            max_length = std::cmp::max(max_length, hs.len());
        } else {
            hs.remove(&s.chars().nth(a_ptr));
            a_ptr += 1;
        }
    }

    max_length as i32
}