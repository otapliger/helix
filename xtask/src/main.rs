mod helpers;
mod path;
mod querycheck;
mod theme_check;

use std::{env, error::Error};

type DynError = Box<dyn Error>;

pub mod tasks {
    use crate::querycheck::query_check;
    use crate::theme_check::theme_check;
    use crate::DynError;

    pub fn querycheck() -> Result<(), DynError> {
        query_check()
    }

    pub fn themecheck() -> Result<(), DynError> {
        theme_check()
    }

    pub fn print_help() {
        println!(
            "
Usage: Run with `cargo xtask <task>`, eg. `cargo xtask query-check`.

    Tasks:
        query-check: Check that tree-sitter queries are valid.
"
        );
    }
}

fn main() -> Result<(), DynError> {
    let task = env::args().nth(1);
    match task {
        None => tasks::print_help(),
        Some(t) => match t.as_str() {
            "query-check" => tasks::querycheck()?,
            "theme-check" => tasks::themecheck()?,
            invalid => return Err(format!("Invalid task name: {}", invalid).into()),
        },
    };
    Ok(())
}
