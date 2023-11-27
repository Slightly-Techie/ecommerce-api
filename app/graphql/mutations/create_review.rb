module Mutations
  class CreateReview < BaseMutation
    argument :product_id, ID, required: true
    argument :rating, Float, required: true
    argument :comment, String, required: false

    field :success, Boolean, null: false

    def resolve(product_id:, rating:, comment: nil)
      review = current_user.reviews.build(product_id: product_id, rating: rating, comment: comment)

      if review.save
        respond 200, success: true
      else
        respond 422, success: false, errors: review.errors.full_messages
      end
    end
  end
end
