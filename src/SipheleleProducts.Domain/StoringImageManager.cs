using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Internal;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Domain.Services;

namespace SipheleleProducts
{
    public class StoringImageManager : DomainService
    {
       
        public async Task<string> SaveImages(IFormFile file)
        {
            var fileName = file.FileName.Split('\\').LastOrDefault()?.Split('/').LastOrDefault();
            if (await UploadFileAsync(file, @"wwwroot\Images\"))
            {
                return "/Images/" + fileName;
            }
            return string.Empty;
        }
        private static async Task<bool> UploadFileAsync(IFormFile file, string fileLocation)
        {
            var fileName = file.FileName.Split('\\').LastOrDefault()?.Split('/').LastOrDefault();
            if (fileName == null)
            {
                return false;
            }
            var filePath = Path.Combine(Directory.GetCurrentDirectory(), fileLocation, fileName);
            await using var stream = System.IO.File.Create(filePath);
            await file.CopyToAsync(stream);

            return true;
        }
    
    }
}
