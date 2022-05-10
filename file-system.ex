File.read("./imNotAFile.txt")
# output: {:error, :enoent}

File.write("./imAFile.txt", "I'm a file `txt`!")
# output: :ok

File.read("./imAFile.txt")
# output: {:ok, "I'm a file `txt`!"}

File.rm("./imAFile.txt")
# output: :ok

File.rm("./imAFile.txt")
# output: {:error, :enoent}

File.rm!("./imAFile.txt")
# output: (File.Error) could not remove file "./imAFile.txt": no such file or directory
