import Foundation

func countFileTypesOnDesktop() 
{
    let fileManager = FileManager.default
    var fileTypesCount = [String: Int]()

    if let desktopDirectory = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first 
    {
        do 
        {
            let files = try fileManager.contentsOfDirectory(at: desktopDirectory, includingPropertiesForKeys: nil, options: [])

            for file in files
            {
                let fileURL = desktopDirectory.appendingPathComponent(file.lastPathComponent)
                let fileExtension = fileURL.pathExtension

                if let count = fileTypesCount[fileExtension] 
                {
                    fileTypesCount[fileExtension] = count + 1
                } 
                else
                {
                    fileTypesCount[fileExtension] = 1
                }
            }

            for (fileType, count) in fileTypesCount 
            {
                print("Тип файла: \(fileType), Количество: \(count)")
            }
        }
        catch
        {
            print("Ошибка при чтении файлов с рабочего стола: \(error)")
        }
    }
}
