
let of_one = function
  | 1 -> "one"
  | 2 -> "two"
  | 3 -> "three"
  | 4 -> "four"
  | 5 -> "five"
  | 6 -> "six"
  | 7 -> "seven"
  | 8 -> "eight"
  | 9 -> "nine"
  | 0 -> ""
  | _ -> raise (failwith "invalid of_one")

let of_tens n =
  if n < 10 then
    of_one n
  else if n < 20 then
    match n with
    | 10 -> "ten"
    | 11 -> "eleven"
    | 12 -> "twelve"
    | 13 -> "thirteen"
    | 14 -> "fourteen"
    | 15 -> "fifteen"
    | 16 -> "sixteen"
    | 17 -> "seventeen"
    | 18 -> "eighteen"
    | 19 -> "nineteen"
    | _ -> raise (failwith "invalid of_tens 1")
  else
    let tens = n/10 in
    let w1 = match tens with
      | 2 -> "twenty"
      | 3 -> "thirty"
      | 4 -> "forty"
      | 5 -> "fifty"
      | 6 -> "sixty"
      | 7 -> "seventy"
      | 8 -> "eighty"
      | 9 -> "ninety"
      | _ -> raise (failwith "invalid of_tens 2")
    in
    let n = n - tens*10 in
    w1 ^ (of_one n)

let of_hundred n =
  let h = n / 100 in
  let n = n - h*100 in
  let tens = of_tens n in
  if String.length tens > 0 then
    (of_one h) ^ "hundredand" ^ tens
  else
    (of_one h) ^ "hundred"

let of_number n =
  if n > 999 then
    "onethousand"
  else if n > 99 then
    of_hundred n
  else
    of_tens n

let () =
  for i=1 to 1000 do
    let r = of_number i in
    Printf.printf "%s" r
  done
