use std::path::{Path, PathBuf};

pub fn project_root() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent()
        .unwrap()
        .to_path_buf()
}

pub fn runtime() -> PathBuf {
    project_root().join("runtime")
}

pub fn ts_queries() -> PathBuf {
    runtime().join("queries")
}

pub fn themes() -> PathBuf {
    runtime().join("themes")
}

pub fn lang_config() -> PathBuf {
    project_root().join("languages.toml")
}
